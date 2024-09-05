package semi.post.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import semi.post.model.service.PostService;

/**
 * Servlet implementation class postInsertController
 */
@WebServlet("/insert.po")

public class postInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 업로드 설정
    private static final String UPLOAD_DIRECTORY = "uploadedImages";  // 파일 저장 폴더
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;      // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 10;        // 10MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50;     // 50MB
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
            request.setAttribute("message", "Error: Form must have enctype=multipart/form-data.");
            getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String title = null;
        String content = null;
        String imagePath = null;
        int mno = 0;

        try {
            List<FileItem> formItems = upload.parseRequest(request);

            if (formItems != null && formItems.size() > 0) {
                for (FileItem item : formItems) {
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        imagePath = UPLOAD_DIRECTORY + File.separator + fileName;
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        item.write(storeFile);
                    } else {
                        String fieldName = item.getFieldName();
                        if (fieldName.equals("mno")) {
                            mno = Integer.parseInt(item.getString());
                        } else if (fieldName.equals("title")) {
                            title = item.getString("UTF-8");
                        } else if (fieldName.equals("content")) {
                            content = item.getString("UTF-8");
                        }
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message", "There was an error: " + ex.getMessage());
            getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }

        int result = new PostService().insertPost(mno, title, content, imagePath);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/list.po?cpage=1");
        } else {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
	


