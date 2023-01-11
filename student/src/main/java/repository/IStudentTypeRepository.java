package repository;

import model.StudentType;

import java.util.List;

public interface IStudentTypeRepository {


    List<StudentType> findAllStudentType();
}
