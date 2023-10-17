package mirae3.com;

import javax.swing.*;
import java.awt.*;

public class dd extends JPanel {
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        // Set color to red
        g.setColor(Color.RED);

        // Draw a point (vertex) at (50, 50)
        g.fillOval(50, 50, 10, 10);
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Vertex Color");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(200, 200);
        
        dd panel = new dd();
        
        frame.add(panel);
        
        frame.setVisible(true);
    }
}

