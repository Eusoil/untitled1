package xju.mapper;

import xju.pojo.Xinxi;

import java.util.List;

public interface XinxiMapper {
    public int InsertInfo(Xinxi xinxi);
    public List<Xinxi> SelectAll();

}
