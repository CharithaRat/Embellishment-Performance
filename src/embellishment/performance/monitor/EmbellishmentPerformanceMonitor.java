
package embellishment.performance.monitor;

import de.javasoft.plaf.synthetica.SyntheticaBlueMoonLookAndFeel;
import de.javasoft.plaf.synthetica.SyntheticaClassyLookAndFeel;
import de.javasoft.plaf.synthetica.SyntheticaSkyMetallicLookAndFeel;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

public class EmbellishmentPerformanceMonitor {

    public static void main(String[] args) throws UnsupportedLookAndFeelException {
        try {
//            UIManager.setLookAndFeel(new SyntheticaClassyLookAndFeel());
            new ProgressBar().setVisible(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
