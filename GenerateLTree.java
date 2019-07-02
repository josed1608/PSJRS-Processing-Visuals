import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

class GenerateLTree {
    static String[] rules = new String[2];
    static String axiom = "F";
    static String sentence = axiom;

    public static void main(String[] args) throws IOException {
        rules[0] = "F";
        rules[1] = "FF+[+F-F-F]-[-F+F+F]";
        sentence = axiom;
        for (int i = 0; i < 5; i++) {
            generate();
        }

        FileWriter fileWriter = new FileWriter("LTree.txt");
        PrintWriter printWriter = new PrintWriter(fileWriter);
        printWriter.print(sentence);
    }

    public static void generate() {
        StringBuilder nextSentence = new StringBuilder();
        for (int i = 0; i < sentence.length(); i++) {
            char current = sentence.charAt(i);
            boolean found = false;
            for (int j = 0; j < 1; j++) {
                if (current == rules[j].charAt(0)) {
                    found = true;
                    nextSentence.append(rules[1]);
                }
            }
            if (!found) {
                nextSentence.append(current);
            }
        }
        sentence = nextSentence.toString();
    }
}
