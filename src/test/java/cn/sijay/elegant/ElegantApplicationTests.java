package cn.sijay.elegant;

import cn.sijay.elegant.gen.entity.GenTable;
import cn.sijay.elegant.gen.mapper.GenTableMapper;
import cn.sijay.elegant.gen.service.GenColumnService;
import cn.sijay.elegant.gen.service.GenService;
import cn.sijay.elegant.system.service.SystemUserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class ElegantApplicationTests {

    @Autowired
    private GenTableMapper genTableMapper;
    @Autowired
    private SystemUserService systemUserService;
    @Autowired
    private GenService genService;
    @Autowired
    private GenColumnService columnService;

    @Test
    public void contextLoads() {
        List<GenTable> list = genTableMapper.selectAll();
        for (GenTable table : list) {
            System.out.println(table);
        }
    }

    @Test
    void testUser() {
        System.out.println(systemUserService.getById(1));
    }

    @Test
    void testGen() {
//        List<String> list = genService.selectTableList(null).stream().map(GenTable::getTableName).toList();
//        genService.importGenTable(List.of(
//                "log_operate",
//                "system_menu",
//                "system_dept",
//                "system_dict_data",
//                "log_login",
//                "system_module",
//                "system_user",
//                "system_message",
//                "system_role",
//                "system_dict",
//                "file_storage",
//                "system_post",
//                "system_config",
//                "system_user_avatar"
//        ));
//        genService.syncDb(1L);
        for (long i = 1; i < 15; i++) {
            genService.generatorCode(i);
        }
    }

    @Test
    void test001() {
    }
}
