package cn.sijay.elegant.core.config;

import cn.sijay.elegant.core.base.BaseEntity;
import com.mybatisflex.core.FlexGlobalConfig;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;

/**
 * MyBatisFlexConfiguration
 *
 * @author sijay
 * @since 2025-05-12
 */
@Configuration
public class MyBatisFlexConfiguration {
    public MyBatisFlexConfiguration() {
        FlexGlobalConfig config = FlexGlobalConfig.getDefaultConfig();
        //设置BaseEntity类启用
        config.registerInsertListener(object -> {
            Long userId = 100L;
            if (object instanceof BaseEntity entity) {
                entity.setCreateBy(userId);
                entity.setCreateDept(userId);
                entity.setCreateTime(LocalDateTime.now());
            }
        }, BaseEntity.class);
        config.registerUpdateListener(object -> {
            Long userId = 100L;
            if (object instanceof BaseEntity entity) {
                entity.setUpdateBy(userId);
                entity.setUpdateTime(LocalDateTime.now());
            }
        }, BaseEntity.class);
    }
}
