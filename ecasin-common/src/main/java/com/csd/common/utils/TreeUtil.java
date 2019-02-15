package com.csd.common.utils;

import com.csd.common.tree.TreeOptions;
import org.springframework.util.StringUtils;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/15 14:44.
 */
@SuppressWarnings({ "rawtypes", "unchecked", "static-access" })
public class TreeUtil {

    public static List getListForJqgridTree(TreeOptions options) throws Exception {
        if (StringUtils.isEmpty(options.getId()) || StringUtils.isEmpty(options.getText())
                || StringUtils.isEmpty(options.getNodeLevel()) || StringUtils.isEmpty(options.getParentId())
                || StringUtils.isEmpty(options.getHasChild())) {
            throw new  Exception("请确保 map 中有 id,text,hasChild,nodeLevel,parentId 参数");
        }
        List<Map<String, Object>> rootList = new ArrayList<Map<String, Object>>();
        Map<String, List<Map<String, Object>>> childMap = new HashMap<String, List<Map<String, Object>>>();
        for (Object obj : options.getDataList()) {
            Map<String, Object> nodeMap = new HashMap<String, Object>();
            nodeMap.put("id", getValue(obj, options.getId()));
            nodeMap.put("text", getValue(obj, options.getText()));


            String nodeLevel = getValue(obj, options.getNodeLevel());
            if (StringUtils.isEmpty(nodeLevel)) {
                nodeMap.put("level", "0");
            } else {
                nodeMap.put("level", nodeLevel);
            }

            String parentId = getValue(obj, options.getParentId());
            if (StringUtils.isEmpty(parentId)) {
                nodeMap.put("parent", "");
            } else {
                nodeMap.put("parent", parentId);
            }

            String orgType = getValue(obj, options.getOrgType());
            if (StringUtils.isEmpty(orgType)) {
                nodeMap.put("orgType", "");
            } else {
                nodeMap.put("orgType", orgType);
            }

            String hasChild = getValue(obj, options.getHasChild());
            if ("1".equals(hasChild)) {
                nodeMap.put("isLeaf", false);
            } else {
                nodeMap.put("isLeaf", true);
            }

            String[] fields = options.getExtendedFields();
            if (fields != null && fields.length > 0) {
                for (String str : fields) {
                    nodeMap.put(str, getValue(obj, str));
                }
            }

            if (options.isOpenAll()) {
                nodeMap.put("expanded", true);
            } else {
                nodeMap.put("expanded", false);
            }
            nodeMap.put("loaded", true);

            if (StringUtils.isEmpty((String) nodeMap.get("parent"))) {
                // 添加根节点
                if (options.isShowRoot()) {
                    nodeMap.put("parent", "root_999");
                } else {
                    nodeMap.put("parent", "");
                }
                rootList.add(nodeMap);
            } else {
                List<Map<String, Object>> childList = childMap.get(nodeMap.get("parent"));
                if (childList == null) {
                    childList = new ArrayList<Map<String, Object>>();
                    childMap.put((String) nodeMap.get("parent"), childList);
                }
                childList.add(nodeMap);
            }
        }

        List<Map<String, Object>> rsList = new ArrayList<Map<String, Object>>();
        // 添加根节点
        if (options.isShowRoot()) {
            Map<String, Object> fristMap = new HashMap<String, Object>();
            fristMap.put("id", "root_999");
            fristMap.put("parent", "");
            if (StringUtils.isEmpty(options.getRootText())) {
                fristMap.put("text", "根节点");
            } else {
                fristMap.put("text", options.getRootText());
            }
            fristMap.put("level", "0");
            fristMap.put("isLeaf", false);
            if (options.isOpenAll()) {
                fristMap.put("expanded", true);
            } else {
                fristMap.put("expanded", false);
            }
            fristMap.put("loaded", true);
            rsList.add(fristMap);
        }

        for (Map<String, Object> rootMap : rootList) {
            rsList.add(rootMap);
            if (!(Boolean) rootMap.get("isLeaf")) {
                rsList = putJQgridTree(rsList, (String) rootMap.get("id"), childMap);
            }
        }

        return rsList;
    }

    private static String getValue(Object obj, String property) throws Exception {
        if ("undefined".equals(property.toLowerCase())) {
            return "";
        }
        try {
            if (obj instanceof Map) {
                return (String) ((Map) obj).get(property);
            } else {
                Class c = obj.getClass();
                Method m = c.getMethod("get" + toUpperCaseFirstOne(property), new Class[] {});
                String rsValue = String.valueOf(m.invoke(obj, new Object[] {}));
                if (!StringUtils.isEmpty(rsValue) && "null".equals(rsValue.toLowerCase())) {
                    return "";
                }
                return rsValue;
            }
        } catch (Exception e) {
            throw new  Exception(e);
        }
    }

    private static String toUpperCaseFirstOne(String s) {
        if (Character.isUpperCase(s.charAt(0))) {
            return s;
        } else {
            return new StringBuilder().append(Character.toUpperCase(s.charAt(0))).append(s.substring(1)).toString();
        }
    }

    private static List<Map<String, Object>> putJQgridTree(List<Map<String, Object>> rsList, String parentId,
                                                           Map<String, List<Map<String, Object>>> childMap) {
        List<Map<String, Object>> putList = childMap.get(parentId);
        if (null != putList && !putList.isEmpty()) {
            for (Map<String, Object> map : putList) {
                if (null != map) {
                    rsList.add(map);
                    if (!(Boolean) map.get("isLeaf")) {
                        rsList = putJQgridTree(rsList, (String) map.get("id"), childMap);
                    }
                }
            }
        }
        return rsList;
    }

    public static List getListForJsTree(TreeOptions options) throws Exception
    {
        if (StringUtils.isEmpty(options.getId()) || StringUtils.isEmpty(options.getText()) || StringUtils.isEmpty(options.getNodeLevel())
                || StringUtils.isEmpty(options.getParentId()) || StringUtils.isEmpty(options.getHasChild()))
        {
            throw new Exception("请确保 map 中有 id,text,hasChild,nodeLevel,parentId 参数");
        }
        List<Map<String, Object>> rootList = new ArrayList<Map<String, Object>>();
        Map<String, List<Map<String, Object>>> childMap = new HashMap<String, List<Map<String, Object>>>();
        for (Object obj : options.getDataList())
        {
            Map<String, Object> nodeMap = new HashMap<String, Object>();
            nodeMap.put("id", getValue(obj, options.getId()));
            nodeMap.put("text", getValue(obj, options.getText()));
            String nodeLevel = getValue(obj, options.getNodeLevel());
            if (StringUtils.isEmpty(nodeLevel))
            {
                nodeMap.put("level", "0");
            }
            else
            {
                nodeMap.put("level", nodeLevel);
            }

            String parentId = getValue(obj, options.getParentId());
            if (StringUtils.isEmpty(parentId))
            {
                nodeMap.put("parent", "");
            }
            else
            {
                nodeMap.put("parent", parentId);
            }

            String hasChild = getValue(obj, options.getHasChild());
            if ("1".equals(hasChild) && options.isOpenAll())
            {
                Map stateMap = new HashMap();
                stateMap.put("opened", true);
                nodeMap.put("state", stateMap);
            }
            nodeMap.put("hasChild", hasChild);

            String[] fields = options.getExtendedFields();
            if (fields != null && fields.length > 0)
            {
                for (String str : fields)
                {
                    nodeMap.put(str, getValue(obj, str));
                }
            }

            if (StringUtils.isEmpty((String) nodeMap.get("parent")))
            {
                if (options.isShowRoot())
                {
                    nodeMap.put("parent", "root_999");
                }
                else
                {
                    nodeMap.put("parent", "#");
                }
                rootList.add(nodeMap);
            }
            else
            {
                List<Map<String, Object>> childList = childMap.get(nodeMap.get("parent"));
                if (childList == null)
                {
                    childList = new ArrayList<Map<String, Object>>();
                    childMap.put((String) nodeMap.get("parent"), childList);
                }
                childList.add(nodeMap);
            }
        }

        List<Map<String, Object>> rsList = new ArrayList<Map<String, Object>>();
        if (options.isShowRoot())
        {
            Map<String, Object> fristMap = new HashMap<String, Object>();
            fristMap.put("id", "root_999");
            fristMap.put("parent", "#");
            if (StringUtils.isEmpty(options.getRootText()))
            {
                fristMap.put("text", "鏍硅妭鐐�");
            }
            else
            {
                fristMap.put("text", options.getRootText());
            }
            fristMap.put("level", "0");
            if (options.isOpenAll())
            {
                Map stateMap = new HashMap();
                stateMap.put("opened", true);
                fristMap.put("state", stateMap);
            }
            rsList.add(fristMap);
        }

        for (Map<String, Object> rootMap : rootList)
        {
            try
            {
                rsList.add(rootMap);
                if ("1".equals(rootMap.get("hasChild")))
                {
                    rsList = putJsTree(rsList, (String) rootMap.get("id"), childMap);
                }
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        return rsList;
    }

    private static List<Map<String, Object>> putJsTree(List<Map<String, Object>> rsList, String parentId,
                                                       Map<String, List<Map<String, Object>>> childMap)
    {
        List<Map<String, Object>> putList = childMap.get(parentId);
        for (Map<String, Object> map : putList)
        {
            try
            {
                rsList.add(map);
                if ("1".equals(map.get("hasChild")))
                {
                    rsList = putJsTree(rsList, (String) map.get("id"), childMap);
                }
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        return rsList;
    }
}
