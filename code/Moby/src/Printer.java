/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author voel
 */
public class Printer implements Yoco {

    public Object apply(Yolan[] args) {
        Object result = args[0].value();
        Main.form.append(result.toString());
        return result;
    }

}
