import java.util.*;

public class first {
    public static List<String> productions = new ArrayList<>();

    public static String getProductionOf(char ch) {
        for (String pro : productions) {
            if (pro.charAt(0) == ch)
                return pro;
        }
        return null;
    }

    public static boolean isNonTerminal(char ch) {
        if (ch >= 'A' && ch <= 'Z')
            return true;
        return false;
    }

    public static boolean findFirst(char ch, HashSet<String> hs) {


        String produc = getProductionOf(ch);
        String[] NTproductions = produc.split("->");
        NTproductions = NTproductions[1].split("/"); // getting all the productions of the particular Non Terminal.

        for (int i = 0; i < NTproductions.length; i++) {
            if(NTproductions[i].charAt(0) == ch){
                continue;
            }
            for (int j = 0; j < NTproductions[i].length(); j++) {
                char c = NTproductions[i].charAt(j);
                if (isNonTerminal(c)) {
                    boolean isEpPresent = findFirst(c, hs);
                    if(isEpPresent){
                        continue;
                    }else{
                        break;
                    }
                }else{
                    if(c == 'e'){
                        return true;
                    }else{
                        hs.add(c+"");
                        break;
                    }
                }
            }
        }
        return false;
    }
    

    public static void main(String[] args) {
        productions.add("A->Bb");
        productions.add("B->Cf/e");
        productions.add("C->c/d/e");
        HashSet<String> hs = new HashSet<>();
        findFirst('A', hs);
        for(String str : hs){
            System.out.println(str);
        }
    }
}