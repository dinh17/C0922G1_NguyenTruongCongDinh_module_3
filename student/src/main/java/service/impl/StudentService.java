package service.impl;

import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService  implements IStudentService {
    IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> displayStudent() {
        return studentRepository.displayStudent();
    }

    @Override
    public Boolean addStudent(Student student) {
        return studentRepository.addStudent(student);
    }

    @Override
    public boolean delete(int id) {
        return studentRepository.delete(id);
    }

    @Override
    public boolean edit(Student student) {
        return studentRepository.edit(student);
    }

    @Override
    public List<Student> find(String name, String phoneNumber, String type) {
        return studentRepository.find(name,phoneNumber,type);
    }
}
