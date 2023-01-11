package service;

import model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> displayStudent();
    Boolean addStudent (Student student);
    boolean delete (int id);
    boolean edit (Student student);
    List<Student> find(String name, String phoneNumber , String type);
}
