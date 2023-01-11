package model;

public class Student {
    private int id ;
    private String name;
    private boolean gender;
    private int age ;
    private int numberPhone ;
    private  ClassType classType ;
    private StudentType studentType;

    public Student(int id, String name, boolean gender, int age, int numberPhone, ClassType classType, StudentType studentType) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.numberPhone = numberPhone;
        this.classType = classType;
        this.studentType = studentType;
    }

    public Student(String name, boolean gender, int age, int numberPhone, ClassType classType, StudentType studentType) {
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.numberPhone = numberPhone;
        this.classType = classType;
        this.studentType = studentType;
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

    public ClassType getClassType() {
        return classType;
    }

    public void setClassType(ClassType classType) {
        this.classType = classType;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(int numberPhone) {
        this.numberPhone = numberPhone;
    }

    public StudentType getStudentType() {
        return studentType;
    }

    public void setStudentType(StudentType studentType) {
        this.studentType = studentType;
    }
}
