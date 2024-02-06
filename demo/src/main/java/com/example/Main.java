package com.example;

import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
 
import java.io.OutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.net.InetSocketAddress;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
 
public class Main {
 
    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8000), 0);
        server.createContext("/", new MyHandler());
        server.setExecutor(null);
        server.start();
    }

    static class MyHandler implements HttpHandler {
        private final Configuration cfg;

        public MyHandler() {
            cfg = new Configuration(Configuration.VERSION_2_3_30);
            cfg.setClassForTemplateLoading(Main.class, "/");
        }

        @Override
        public void handle(HttpExchange t) throws IOException {
            try {
                String[] card = {"Black", "Platinum", "Junior", "Premium"};
                Random random = new Random();
                int index = random.nextInt(card.length);
                boolean isEligible = random.nextBoolean();

                Map<String, Object> data = new HashMap<>();
                data.put("card", card[index]);
                data.put("eligible", isEligible);

                Template template = cfg.getTemplate("template.ftl");

                StringWriter sw = new StringWriter();
                template.process(data, sw);
                String response = sw.toString();

                t.sendResponseHeaders(200, response.length());
                OutputStream os = t.getResponseBody();
                os.write(response.getBytes());
                os.close();
            } catch (TemplateException e) {
                e.printStackTrace();
            }
        }
    }
}