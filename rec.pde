final String smoky_typo = getClass().getName();

import com.hamoid.*;
VideoExport videoExport;

void rec() {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, "../"+smoky_typo+".mp4");
    videoExport.setFrameRate(30);  
    videoExport.startMovie();
  }
  videoExport.saveFrame();
}
