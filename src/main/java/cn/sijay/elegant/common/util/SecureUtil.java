package cn.sijay.elegant.common.util;

import cn.sijay.elegant.common.entity.Pair;
import cn.sijay.elegant.core.exception.UtilException;
import org.bouncycastle.asn1.gm.GMNamedCurves;
import org.bouncycastle.asn1.x9.X9ECParameters;
import org.bouncycastle.crypto.engines.SM2Engine;
import org.bouncycastle.crypto.params.ECDomainParameters;
import org.bouncycastle.crypto.params.ECPrivateKeyParameters;
import org.bouncycastle.crypto.params.ECPublicKeyParameters;
import org.bouncycastle.jce.ECNamedCurveTable;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.jce.spec.ECParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.IvParameterSpec;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.interfaces.ECPrivateKey;
import java.security.interfaces.ECPublicKey;
import java.security.spec.ECPoint;

/**
 * SecureUtil
 *
 * @author sijay
 * @since 2025-05-27
 */
public class SecureUtil {
    static String provider = "BC";

    static {
        Security.addProvider(new BouncyCastleProvider());
    }

    // 生成 AES-256 密钥
    public static SecretKey generateAesKey() throws Exception {
        KeyGenerator keyGen = KeyGenerator.getInstance("AES", provider);
        keyGen.init(256); // 128, 192, 256
        return keyGen.generateKey();
    }

    // AES加密（GCM + 无填充）
    public static String aesEncrypt(SecretKey key, String input) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding", provider);
        byte[] iv = new byte[12]; // GCM 推荐 12 字节 IV
        new SecureRandom().nextBytes(iv);
        cipher.init(Cipher.ENCRYPT_MODE, key, new GCMParameterSpec(128, iv));
        byte[] ciphertext = cipher.doFinal(input.getBytes(StandardCharsets.UTF_8));
        // 合并 IV、密文和认证标签（自动附加）
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        bos.write(iv);
        bos.write(ciphertext);

        return EncodeUtil.base64Encode(bos.toByteArray());
    }

    // AES解密
    public static String aesDecrypt(SecretKey key, String input) throws Exception {
        byte[] ivAndCiphertext = EncodeUtil.base64Decode(input);
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding", provider);
        // 分离 IV 和密文（认证标签包含在密文中）
        byte[] iv = new byte[12];
        byte[] ciphertext = new byte[ivAndCiphertext.length - 12];
        System.arraycopy(ivAndCiphertext, 0, iv, 0, 12);
        System.arraycopy(ivAndCiphertext, 12, ciphertext, 0, ciphertext.length);
        cipher.init(Cipher.DECRYPT_MODE, key, new GCMParameterSpec(128, iv));
        return EncodeUtil.base64Encode(cipher.doFinal(ciphertext));
    }

    // 生成 SM2 密钥对
    public static Pair<PublicKey, PrivateKey> generateSm2Key() throws Exception {
        ECParameterSpec ecSpec = ECNamedCurveTable.getParameterSpec("sm2p256v1");
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("EC", "BC");
        keyPairGenerator.initialize(ecSpec, new SecureRandom());
        KeyPair keyPair = keyPairGenerator.generateKeyPair();
        return new Pair<>(keyPair.getPublic(), keyPair.getPrivate());
    }

    // SM2签名
    public static String sm2Sign(PrivateKey privateKey, String input) throws Exception {
        Signature signature = Signature.getInstance("SM3WithSM2", "BC");
        signature.initSign(privateKey);
        signature.update(input.getBytes(StandardCharsets.UTF_8));
        return EncodeUtil.base64Encode(signature.sign());
    }

    // SM2验签
    public static boolean sm2Verify(PublicKey publicKey, String data, String sign) throws Exception {
        Signature signature = Signature.getInstance("SM3WithSM2", "BC");
        signature.initVerify(publicKey);
        signature.update(data.getBytes(StandardCharsets.UTF_8));
        return signature.verify(EncodeUtil.base64Decode(sign));
    }

    // SM2加密
    public static String sm2Encrypt(PublicKey publicKey, String input) throws Exception {
        // 转换公钥
        ECPublicKey ecPublicKey = (ECPublicKey) publicKey;
        X9ECParameters sm2Parameters = GMNamedCurves.getByName("sm2p256v1");
        // 转换公钥点
        ECPoint w = ecPublicKey.getW();
        ECPublicKeyParameters ecPublicKeyParameters = new ECPublicKeyParameters(
                sm2Parameters.getCurve().createPoint(w.getAffineX(), w.getAffineY()),
                new ECDomainParameters(sm2Parameters.getCurve(), sm2Parameters.getG(), sm2Parameters.getN(), sm2Parameters.getH())
        );
        SM2Engine engine = new SM2Engine();
        engine.init(true, ecPublicKeyParameters);
        byte[] bytes = input.getBytes(StandardCharsets.UTF_8);
        return EncodeUtil.base64Encode(engine.processBlock(bytes, 0, bytes.length));
    }

    // SM2解密
    public static String sm2Decrypt(PrivateKey privateKey, String input) throws Exception {
        ECPrivateKey ecPrivateKey = (ECPrivateKey) privateKey;
        X9ECParameters sm2Parameters = GMNamedCurves.getByName("sm2p256v1");
        ECDomainParameters domainParameters = new ECDomainParameters(
                sm2Parameters.getCurve(),
                sm2Parameters.getG(),
                sm2Parameters.getN(),
                sm2Parameters.getH()
        );
        ECPrivateKeyParameters ecPrivateKeyParameters = new ECPrivateKeyParameters(ecPrivateKey.getS(), domainParameters);
        SM2Engine engine = new SM2Engine();
        engine.init(false, ecPrivateKeyParameters);
        byte[] bytes = input.getBytes(StandardCharsets.UTF_8);
        return EncodeUtil.base64Encode(engine.processBlock(bytes, 0, bytes.length));
    }

    /**
     * SM3
     */
    public static String sm3(String input) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SM3", provider);
        } catch (NoSuchAlgorithmException | NoSuchProviderException e) {
            throw new UtilException(e.getLocalizedMessage());
        }
        return EncodeUtil.base64Encode(md.digest(input.getBytes(StandardCharsets.UTF_8)));
    }

    // 生成 SM4 密钥（固定 128 位）
    public static SecretKey generateSm4Key() throws Exception {
        KeyGenerator keyGen = KeyGenerator.getInstance("SM4", provider);
        keyGen.init(128); // SM4 仅支持 128 位密钥
        return keyGen.generateKey();
    }

    // SM4加密（CBC + PKCS7 填充）
    public static String sm4Encrypt(SecretKey key, String plaintext) throws Exception {
        Cipher cipher = Cipher.getInstance("SM4/CBC/PKCS7Padding", provider);
        byte[] iv = new byte[16]; // SM4 分组大小 128 位（16 字节）
        new SecureRandom().nextBytes(iv);
        cipher.init(Cipher.ENCRYPT_MODE, key, new IvParameterSpec(iv));
        byte[] ciphertext = cipher.doFinal(plaintext.getBytes(StandardCharsets.UTF_8));
        // 合并 IV 和密文
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        bos.write(iv);
        bos.write(ciphertext);
        return EncodeUtil.base64Encode(bos.toByteArray());
    }

    // SM4解密
    public static String sm4Decrypt(SecretKey key, String input) throws Exception {
        byte[] ivAndCiphertext = EncodeUtil.base64Decode(input);
        Cipher cipher = Cipher.getInstance("SM4/CBC/PKCS7Padding", provider);
        // 分离 IV 和密文
        byte[] iv = new byte[16];
        byte[] ciphertext = new byte[ivAndCiphertext.length - 16];
        System.arraycopy(ivAndCiphertext, 0, iv, 0, 16);
        System.arraycopy(ivAndCiphertext, 16, ciphertext, 0, ciphertext.length);

        cipher.init(Cipher.DECRYPT_MODE, key, new IvParameterSpec(iv));
        return EncodeUtil.base64Encode(cipher.doFinal(ciphertext));
    }

    // 计算哈希值（支持 SHA-256/SHA-512）
    public static String sha256(String input) throws Exception {
        return EncodeUtil.base64Encode(MessageDigest.getInstance("SHA-256", provider).digest(input.getBytes(StandardCharsets.UTF_8)));
    }

    public static String sha512(String input) throws Exception {
        return EncodeUtil.base64Encode(MessageDigest.getInstance("SHA-512", provider).digest(input.getBytes(StandardCharsets.UTF_8)));
    }

    // 计算文件哈希（内存高效）
    public static String hashFile(InputStream inputStream) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256", provider);
        byte[] buffer = new byte[8192];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            md.update(buffer, 0, bytesRead);
        }
        return EncodeUtil.base64Encode(md.digest());
    }

}
