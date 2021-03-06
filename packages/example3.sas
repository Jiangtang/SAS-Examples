
proc template;
    define tagset tagsets.test;
        parent=tagsets.html4;
        default_mimetype = "text/html";
        stylesheet_mimetype = "text/css";
    end;
run;

proc template;
    
    define package packages.example3;

         /* publish info */               /* where to publish to.  archive, webdav, queue, email, etc. */
         /* publish properties, key value pairs. */

         publish = Archive properties ( archive_path="./" archive_name="example3.zip");  

         Description = "This is my description";
         Abstract = "This is my abstract";

         clear = yes;
         
         NameValue = 'path="./"';


         /* Paths.  Where to put stuff inside the package */

         default_path = "./";

         path './'
                files = body contents frame code data
         ;  

         path 'style/'
                mimetypes = "text/css";
         ;  

         path 'style/'
                files = stylesheet
         ;  

         path 'images/'
                mimetypes = "image/bmp image/gif image/jpg image/png"
         ;

         path 'drawing/'
                mimetypes = "image/svg+xml"
         ;

         path 'rtf/'
                mimetypes = "text/rtf text/richtext"
         ;  


    end;
    
run;


ods listing close;

goptions dev=gif xpixels=480 ypixels=320;

ods package open template=example3;

ods html package;

 proc gplot data=sashelp.class;
     plot height*weight;
     by name;
 run;
 quit;    

ods html close;

ods package add file="example3.sas" path="sas" mimetype="text/plain";

ods package publish;


ods package close;
    



