package com.springapp.mvc.syncmodel;

import com.springapp.mvc.User;
import com.springapp.mvc.dhis.HttpClientExample;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: kip
 * Date: 7/29/13
 * Time: 3:48 PM
 * To change this template use File | Settings | File Templates.
 */
public class getall {
    User user = new User() ;
    HttpClientExample dhis=new HttpClientExample();
 /*   public static void main(String []args){
        getall get=new getall();
        try {
            get.send();
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

    }  */
    public List<SyncDataSet> send (String Username,String pass,String Url) throws Exception{

     /*   user.setUsername("admin");
        user.setPassword("district");
        user.setUrl("http://localhost:8090/dhis");   */
        String username=Username;
        String password=pass;
        String url=Url;
        List<SyncDataSet> readDEG=new ArrayList<SyncDataSet>();
        String OpenmrsdeURL = "";
            if(!username.equals("")&&!password.equals("")){
        String datasets= dhis.sendGet( username,password, url+"/api/dataSets.xml");
                InputStream stream = new ByteArrayInputStream(  datasets.getBytes( "UTF-8" ) );
                System.out.println( datasets);
                StaXParser read = new StaXParser();

               readDEG = read.readConfig(stream);

                System.out.println("Total DataSets......."+"\n" );

                for ( SyncDataSet item : readDEG )
                {


                    System.out.println( item.getName());

                    //Search for "openmrsde" dataelement group
                   /* if ( item.getId().equals( "UpS2bTVcClZ" ) ){
                        OpenmrsdeURL = item.getHref();
                        dataelem(OpenmrsdeURL);

                    }  */
                }
                System.out.println("Total DataSets:="+readDEG.size());
            }
        else{

                System.out.println("Username or password missing");
            }

        return  readDEG;
    }
    public List<SyncDataElement> dataelem (String Username,String pass,String Url) throws Exception{
        String username=Username;
        String password=pass;
        String url=Url;
        String dataelements= dhis.sendGet( username,password, url);
        InputStream stream = new ByteArrayInputStream(dataelements.getBytes( "UTF-8" ) );
        System.out.println(dataelements);
        StaXParser read = new StaXParser();
        List<SyncDataElement> readELEM = read.readDe(stream);
        System.out.println("Total DataElements......."+"\n" );
        for ( SyncDataElement item : readELEM )
        {
            //Search for "openmrsde" dataelement group

           // String OpenmrsdeURL = item.getHref();
           // dataelem(OpenmrsdeURL);
            System.out.println( item.getName());


        }

        System.out.println("Total DataElements="+readELEM.size());
        return readELEM;
    }
}
