package model;

public class StudentType {
    private  int id ;
    private  String name ;

    public StudentType(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public StudentType(int studentTypeId) {
        this.id = studentTypeId;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
