package com.csd.common.page;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/30 16:48.
 */
public class PageVo<T> {

    protected int              page      = 1;                 // 页码
    protected int              rows      = 10;                // 每页显示数量
    protected String           sidx      = null;              // 排序字段
    protected String           sord      = null;              // 排序规则
    protected long             total     = -1L;               // 总页数
    protected long             records   = -1L;               // 总记录数
    protected boolean          autoCount = true;
    protected List<T> result    = new ArrayList<T>();
    public static final String ASC       = "asc";
    public static final String DESC      = "desc";

    public PageVo() {}

    public PageVo(int rows)
    {
        this.rows = rows;
    }

    public int getPage()
    {
        return this.page;
    }

    public void setPage(int page)
    {
        this.page = page;

        if (page < 1)
            this.page = 1;
    }

    public PageVo<T> page(int thePage)
    {
        setPage(thePage);
        return this;
    }

    public int getRows()
    {
        return this.rows;
    }

    public void setRows(int rows)
    {
        this.rows = rows;

        if (rows < 1)
            this.rows = 1;
    }

    public PageVo<T> rows(int theRows)
    {
        setRows(theRows);
        return this;
    }

    public int getFirst()
    {
        return (this.page - 1) * this.rows + 1;
    }

    public String getSidx()
    {
        return this.sidx;
    }

    public void setSidx(String sidx)
    {
        this.sidx = sidx;
    }

    public PageVo<T> sidx(String theSidx)
    {
        setSidx(theSidx);
        return this;
    }

    public String getSord()
    {
        return this.sord;
    }

    public void setSord(String sord)
    {
        if (StringUtils.hasLength(sord))
        {
            String[] Sords = sord.split(",");
            for (String SordStr : Sords)
            {
                if ("desc".equalsIgnoreCase(SordStr) && "asc".equalsIgnoreCase(SordStr))
                {
                    throw new IllegalArgumentException("排序方向" + SordStr + "不是合法值");
                }
            }
            this.sord = sord.toLowerCase();
        }
    }

    public PageVo<T> sord(String theSord)
    {
        setSord(theSord);
        return this;
    }

    public boolean isSidxSetted()
    {
        return (StringUtils.hasText(this.sidx)) && (StringUtils.hasText(this.sord));
    }

    public boolean isAutoCount()
    {
        return this.autoCount;
    }

    public void setAutoCount(boolean autoCount)
    {
        this.autoCount = autoCount;
    }

    public PageVo<T> autoCount(boolean theAutoCount)
    {
        setAutoCount(theAutoCount);
        return this;
    }

    public List<T> getResult()
    {
        return this.result;
    }

    public void setResult(List<T> result)
    {
        this.result = result;
    }

    public long getTotal()
    {
        return this.total;
    }

    public void setTotal(long total)
    {
        this.total = total;
    }

    public long getRecords()
    {
        return records;
    }

    public void setRecords(long records)
    {
        this.records = records;
    }

    public long getTotalPages()
    {
        if (this.records < 0L)
        {
            return -1L;
        }

        long count = this.records / this.rows;
        if (this.records % this.rows > 0L)
        {
            count += 1L;
        }
        return count;
    }

    public boolean isHasNext()
    {
        return this.page + 1 <= getTotalPages();
    }

    public int getNextPage()
    {
        if (isHasNext())
        {
            return this.page + 1;
        }
        return this.page;
    }

    public boolean isHasPre()
    {
        return this.page - 1 >= 1;
    }

    public int getPrePage()
    {
        if (isHasPre())
        {
            return this.page - 1;
        }
        return this.page;
    }

    public PageBounds pageToPageBounds(PageVo<T> page)
    {
        PageBounds pageBounds = new PageBounds(this.page, this.rows);
        ;
        if (0 < page.getPage() && 0 < page.getRows())
        {
            pageBounds = new PageBounds(page.getPage(), page.getRows());
        }
        if (page.isSidxSetted())
        {
            StringBuffer orderSb = new StringBuffer(page.getSidx());
            orderSb.append('.');
            if (!PageVo.ASC.equals(page.getSord()))
            {
                orderSb.append(PageVo.DESC);
            }
            else
            {
                orderSb.append(PageVo.ASC);
            }
            pageBounds.setOrders(Order.formString(orderSb.toString()));
        }
        return pageBounds;
    }

    public PageVo<T> listToPage(PageVo<T> page, PageList<T> list)
    {
        if (null != list && null != list.getPaginator())
        {
            page.setRecords(list.getPaginator().getTotalCount());
        }
        page.setResult(list);
        page.setTotal(this.getTotalPages());
        return page;
    }

}
