package repository;

import model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> displayStudent();
    Boolean addStudent (Student student);
    boolean delete (int id);
    boolean edit (Student student);
    List<Student> find(String name, String phoneNumber , String type);

}
