/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dataobj;

import java.util.ArrayList;

/**
 *
 * @author LucasBV
 */
public class Question {
    private int questionID;
    private String content;
    private ArrayList<Answer> listAnswer;

    public Question() {
    }

    public Question(int questionID, String content, ArrayList<Answer> listAnswer) {
        this.questionID = questionID;
        this.content = content;
        this.listAnswer = listAnswer;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public ArrayList<Answer> getListAnswer() {
        return listAnswer;
    }

    public void setListAnswer(ArrayList<Answer> listAnswer) {
        this.listAnswer = listAnswer;
    }
    
}
