package service.impl;

import model.ClassType;
import repository.IClassRepository;
import repository.impl.ClassRepository;
import service.IClassService;

import java.util.List;

public class ClassService  implements IClassService {
    IClassRepository classRepository = new ClassRepository();
    @Override
    public List<ClassType> findAllClass() {
        return classRepository.findAllClass();
    }
}
