package service.impl;

import model.StudentType;
import repository.IStudentTypeRepository;
import repository.impl.StudentTypeRepository;
import service.IStudentTypeService;

import java.util.List;

public class StudentTypeService implements IStudentTypeService {

     IStudentTypeRepository studentTypeRepository = new StudentTypeRepository();
    @Override
    public List<StudentType> findAllStudentType() {
       return  studentTypeRepository.findAllStudentType();
    }
}
