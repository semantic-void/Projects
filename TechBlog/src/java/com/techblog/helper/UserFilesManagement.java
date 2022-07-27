package com.techblog.helper;

import com.sun.istack.internal.logging.Logger;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;

public class UserFilesManagement {

    public static Boolean deleteFile(String path) {
        try {
            File file = new File(path);
            file.delete();
            return true;
        } catch (Exception ex) {
            Logger.getLogger(UserFilesManagement.class.getClass()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    /**
     * The image will be saved in " build (pics)" folder, not in project(pics)
     * folder.
     *
     * @param in
     * @param path
     * @return
     */
    public static Boolean saveFlie(InputStream in, String path) {
        try {
            //Searching directory and removing the name of image from directory.
            File theDir = new File(path.substring(0, path.lastIndexOf(File.separator)));
            if (!theDir.exists()) {
                theDir.mkdirs();
            }

            byte data[] = new byte[in.available()];
            in.read(data);
            try (FileOutputStream fos = new FileOutputStream(path)) {
                fos.write(data);
                fos.flush();
            }
            return true;
        } catch (IOException ex) {
            Logger.getLogger(UserFilesManagement.class.getClass()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
