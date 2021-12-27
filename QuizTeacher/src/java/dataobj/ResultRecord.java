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
public class ResultRecord {

    private int id;
    private int questionID;
    private int studentID;
    private String name;
    private double process;
    ArrayList<Boolean> listAns;

    public ResultRecord() {
    }

    public ResultRecord(int id, int questionID, int studentID, String name, double process, ArrayList<Boolean> listAns) {
        this.id = id;
        this.questionID = questionID;
        this.studentID = studentID;
        this.name = name;
        this.process = process;
        this.listAns = listAns;
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

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getProcess() {
        return process;
    }

    public void setProcess(double process) {
        this.process = process;
    }

    public ArrayList<Boolean> getListAns() {
        return listAns;
    }

    public void setListAns(ArrayList<Boolean> listAns) {
        this.listAns = listAns;
    }

}
