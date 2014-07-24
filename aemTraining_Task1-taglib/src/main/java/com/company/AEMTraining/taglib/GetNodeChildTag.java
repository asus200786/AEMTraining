package com.company.AEMTraining.taglib;

import java.io.IOException;
import javax.jcr.Node;
import javax.jcr.NodeIterator;
import javax.jcr.RepositoryException;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ResourceResolverFactory;

import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.TagSupport;

public class GetNodeChildTag  extends TagSupport implements DynamicAttributes {


    private static final long serialVersionUID = 1L;

    private Map<String, Object> inputMap = new LinkedHashMap<String, Object>();

    @Override
    public int doStartTag() throws JspException {
        Map<String, Object> outputMap = new LinkedHashMap<String, Object>();
        try {
            for (String name : inputMap.keySet()){
                String newName = (String)inputMap.get(name);
                SlingHttpServletRequest req = (SlingHttpServletRequest)pageContext.getRequest();
                ResourceResolver resourceResolver = req.getResourceResolver() ;
                Resource resource =resourceResolver.getResource(newName);
                Node eachNode = resource.adaptTo(Node.class);
                NodeIterator iterator = eachNode.getNodes();

                if(iterator.hasNext()){
                    //skip firs jcr: node
                    iterator.nextNode();
                }
                while (iterator.hasNext()){
                    Node node = iterator.nextNode();

                    outputMap.put(node.getName(), node.getPath());

                }
                pageContext.setAttribute(name, outputMap );
            }
        } catch (RepositoryException e) {
            e.printStackTrace();
        }

        return SKIP_BODY;

    }

    public void setDynamicAttribute(String arg0, String name, Object value)
            throws JspException {
        inputMap.put(name, value);
    }

}