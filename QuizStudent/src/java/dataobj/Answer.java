/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dataobj;

/**
 *
 * @author LucasBV
 */
public class Answer {
    private int id;
    private int questionID;
    private String content;
    private boolean isCorrectAnswer;

    public Answer() {
    }

    public Answer(int id, int questionID, String content, boolean isCorrectAnswer) {
        this.id = id;
        this.questionID = questionID;
        this.content = content;
        this.isCorrectAnswer = isCorrectAnswer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public boolean isIsCorrectAnswer() {
        return isCorrectAnswer;
    }

    public void setIsCorrectAnswer(boolean isCorrectAnswer) {
        this.isCorrectAnswer = isCorrectAnswer;
    }
    
}
