
package com.carbo.checklist.services;

import com.carbo.checklist.repository.CheckListMongoDbRepository;
import com.carbo.checklist.model.CheckList;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class CheckListServiceTest {

    @Mock
    private CheckListMongoDbRepository checkListRepository;

    @InjectMocks
    private CheckListService checkListService;

    @Test
    void shouldReturnAllCheckListsWhenGetAllIsCalled() {
        CheckList checkList = new CheckList();
        List<CheckList> expectedCheckLists = Collections.singletonList(checkList);
        when(checkListRepository.findAll()).thenReturn(expectedCheckLists);

        List<CheckList> actualCheckLists = checkListService.getAll();

        assertEquals(expectedCheckLists, actualCheckLists);
        verify(checkListRepository, times(1)).findAll();
    }

    @Test
    void shouldReturnCheckListsByJobIdWhenGetByJobIdIsCalled() {
        String jobId = "testJobId";
        CheckList checkList = new CheckList();
        List<CheckList> expectedCheckLists = Collections.singletonList(checkList);
        when(checkListRepository.findByJobId(jobId)).thenReturn(expectedCheckLists);

        List<CheckList> actualCheckLists = checkListService.getByJobId(jobId);

        assertEquals(expectedCheckLists, actualCheckLists);
        verify(checkListRepository, times(1)).findByJobId(jobId);
    }

    @Test
    void shouldReturnCheckListWhenGetCheckListIsCalled() {
        String checkListId = "testId";
        CheckList checkList = new CheckList();
        Optional<CheckList> expectedCheckList = Optional.of(checkList);
        when(checkListRepository.findById(checkListId)).thenReturn(expectedCheckList);

        Optional<CheckList> actualCheckList = checkListService.getCheckList(checkListId);

        assertEquals(expectedCheckList, actualCheckList);
        verify(checkListRepository, times(1)).findById(checkListId);
    }

    @Test
    void shouldSaveCheckListWhenSaveCheckListIsCalled() {
        CheckList checkList = new CheckList();
        when(checkListRepository.save(checkList)).thenReturn(checkList);

        CheckList savedCheckList = checkListService.saveCheckList(checkList);

        assertEquals(checkList, savedCheckList);
        verify(checkListRepository, times(1)).save(checkList);
    }

    @Test
    void shouldUpdateCheckListWhenUpdateCheckListIsCalled() {
        CheckList checkList = new CheckList();

        checkListService.updateCheckList(checkList);

        verify(checkListRepository, times(1)).save(checkList);
    }

    @Test
    void shouldDeleteCheckListWhenDeleteCheckListIsCalled() {
        String checkListId = "testId";

        checkListService.deleteCheckList(checkListId);

        verify(checkListRepository, times(1)).deleteById(checkListId);
    }
}
