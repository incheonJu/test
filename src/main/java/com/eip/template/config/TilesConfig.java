package com.eip.template.config;

import org.apache.tiles.Attribute;
import org.apache.tiles.Definition;
import org.apache.tiles.definition.DefinitionsFactory;
import org.apache.tiles.request.Request;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 이주환 on 2015-09-16.
 */
@Configuration
public class TilesConfig implements DefinitionsFactory {
    private static final Map<String, Definition> tilesDefinitions = new HashMap<String,Definition>();
    private static final Attribute BASE_TEMPLATE = new Attribute("/WEB-INF/views/layout/admin/template_login.jsp");
    private static final Attribute BASE_TEMPLATE_LOGIN = new Attribute("/WEB-INF/views/tiles/admin/template_login.jsp");

    @Override
    public Definition getDefinition(String name, Request tilesContext) {
        return tilesDefinitions.get(name);
    }

    /**
     * @param name <code>Name of the view</code>
     * @param title <code>Page title</code>
     * @param body <code>Body JSP file path</code>
     *
     * <code>Adds default layout definitions</code>
     */
    private static void addFrontDefaultLayoutDef(String name, String title, String body) {
        Map<String, Attribute> attributes = new HashMap<String,Attribute>();

        attributes.put("title", new Attribute(title));
        attributes.put("header", new Attribute("/WEB-INF/views/tiles/front/header.jsp"));
        //attributes.put("left", new Attribute("/WEB-INF/views/layout/menu.jsp"));
        attributes.put("body", new Attribute(body));
        attributes.put("footer", new Attribute("/WEB-INF/views/tiles/footer.jsp"));

        tilesDefinitions.put(name, new Definition(name, BASE_TEMPLATE, attributes));
    }

    private static void addAdminDefaultLayoutDef(String name, String title, String body) {
        Map<String, Attribute> attributes = new HashMap<String,Attribute>();

        attributes.put("title", new Attribute(title));
        //attributes.put("meta", new Attribute("/WEB-INF/views/tiles/admin/common/meta.jsp"));
        attributes.put("header", new Attribute("/WEB-INF/views/tiles/admin/common/header.jsp"));
        attributes.put("left", new Attribute("/WEB-INF/views/tiles/admin/common/left.jsp"));
        attributes.put("body", new Attribute(body));
        attributes.put("footer", new Attribute("/WEB-INF/views/tiles/admin/common/footer.jsp"));

        tilesDefinitions.put(name, new Definition(name, BASE_TEMPLATE, attributes));
    }

    private static void addAdminLoginLayoutDef(String name, String title, String body) {
        Map<String, Attribute> attributes = new HashMap<String,Attribute>();

        attributes.put("title", new Attribute(title));
        attributes.put("meta", new Attribute("/WEB-INF/views/tiles/admin/common/meta.jsp"));
        attributes.put("body", new Attribute(body));

        tilesDefinitions.put(name, new Definition(name, BASE_TEMPLATE_LOGIN, attributes));
    }
    /**
     * <code>Add Apache tiles definitions</code>
     */
    public static void addDefinitions(){
        addAdminLoginLayoutDef("admin/login", "Login", "/WEB-INF/views/admin/login.jsp");
    }

}
