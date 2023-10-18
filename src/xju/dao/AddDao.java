package xju.dao;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import xju.mapper.XinxiMapper;
import xju.pojo.Xinxi;

import java.io.IOException;
import java.io.InputStream;

public class AddDao {
    public void insert(Xinxi xinxi) throws IOException {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();
        try {
            XinxiMapper insertInfoMapper = session.getMapper(XinxiMapper.class);
            insertInfoMapper.InsertInfo(xinxi);
            session.commit();
        } finally {
            session.close();
        }

    }

}
