package com.springapp.mvc.syncmodel;

import com.springapp.mvc.User;
import com.springapp.mvc.dhis.HttpClientExample;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: kip
 * Date: 7/29/13
 * Time: 3:48 PM
 * To change this template use File | Settings | File Templates.
 */
public class getall {
   public  void send () throws Exception{
    User user =new User();
    String username=user.getUsername();
    String password=user.getPassword();
    String url= user.getUrl();
    HttpClientExample dhis=new HttpClientExample();
   String datasets= dhis.sendGet( username,password, url+"/api/dataSets.xml");
       InputStream stream = new ByteArrayInputStream(  datasets.getBytes( "UTF-8" ) );
       System.out.println( datasets);
       StaXParser read = new StaXParser();
       List<SyncDataSet> readDEG = read.readConfig(stream);
}
    
}
