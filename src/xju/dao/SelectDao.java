package xju.dao;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import xju.mapper.XinxiMapper;
import xju.pojo.Xinxi;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class SelectDao {
    public List<Xinxi> select() throws IOException {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();
        try {
            XinxiMapper xinxiMapper = session.getMapper(XinxiMapper.class);
            List<Xinxi> xinxiList = xinxiMapper.SelectAll();
            return xinxiList;
        } finally {
            session.close();
        }
    }
}
