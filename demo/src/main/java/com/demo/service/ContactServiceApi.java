package com.demo.service;

import com.demo.dto.BookingDTO;
import com.demo.dto.ChildDTO;
import com.demo.dto.ContactDTO;
import com.demo.model.*;
import com.demo.repository.BookingRepositoryApi;
import com.demo.repository.ContactRepositoryApi;

import java.util.ArrayList;
import java.util.List;

public class ContactServiceApi {
    private ContactRepositoryApi contactRepositoryApi = new ContactRepositoryApi();
    private BookingRepositoryApi bookingRepositoryApi = new BookingRepositoryApi();

    // Show list of contacts DISPLAY_CONTACT = "/contact/display"--> done
    public List<ContactDTO> getAllContactApi() {

        List<ContactApi> contactList = contactRepositoryApi.getAllContactApi();
        List<ContactDTO> contactDTOList = new ArrayList<>();

        for (ContactApi contact : contactList) {
            ContactDTO contactDTO = new ContactDTO();
            contactDTO.setId(contact.getId());
            String fullName = contact.getFirstName() + " " + contact.getLastName();
            contactDTO.setFullName(fullName);
            contactDTO.setRelationship(contact.getRelationship());
            contactDTOList.add(contactDTO);
        }

        return contactDTOList;
    }

    public boolean getAllContactIsSuccessApi() {
        List<ContactApi> contactList = contactRepositoryApi.getAllContactApi();
        return !contactList.isEmpty();
    }


    // Show list of children by contactId DISPLAY_CONTACT_CHILD = "/contact/display/children" --> done
    public ContactDTO getChildrenByContactApi(int id) {
        // step 1: Make a list of ChildDTO
        List<ChildApi> list = contactRepositoryApi.getChildrenByContactApi(id);
        List<ChildDTO> childDTOList = new ArrayList<>();
        for (ChildApi item : list) {

            ChildDTO object = new ChildDTO();

            object.setId(item.getId());
            String childFullName = item.getFirstName() + " " + item.getLastName();
            object.setFullName(childFullName);
            object.setGender(item.isGender());
            object.setBirthDay(item.getBirthday());

            childDTOList.add(object);
        }

        //Step 2: make a list of ContactChildDTO
        ContactDTO returnObject = new ContactDTO();
        ContactApi contact = contactRepositoryApi.getContactByIdApi(id);

        returnObject.setId(contact.getId());
        String contactFullName = contact.getFirstName() + " " + contact.getLastName();
        returnObject.setFullName(contactFullName);
        returnObject.setRelationship(contact.getRelationship());
        returnObject.setChildDTOList(childDTOList);

        //step 3: return object<ContactDTO>
        return returnObject;
    }


    // Show contact - list of children by contactId - list of booking by childId DISPLAY_CONTACT_CHILD_BOOKING = "/contact/display/children/booking"
    public ContactDTO getBookingChildrenByContactApi(int id) {
        // step 1: Make a list of ChildDTO
        List<ChildApi> list = contactRepositoryApi.getChildrenByContactApi(id);
        List<ChildDTO> childDTOList = new ArrayList<>();
        for (ChildApi item : list) {
            // make a object ChildDTO
            ChildDTO object = new ChildDTO();
            // set id (child_id), fullName, gender, birthday
            object.setId(item.getId());
            String childFullName = item.getFirstName() + " " + item.getLastName();
            object.setFullName(childFullName);
            object.setGender(item.isGender());
            object.setBirthDay(item.getBirthday());

            // get and set Booking list of child
            List<BookingDTO> bookingDTOList = new ArrayList<>();
            List<BookingApi> bookingList = bookingRepositoryApi.getAllBookingByChildID(item.getId());
            for(BookingApi bookingItem : bookingList){
                BookingDTO bookingDTOObject = new BookingDTO();
                bookingDTOObject.setId(bookingItem.getId());
                bookingDTOObject.setRoom(bookingItem.getRoom());
                bookingDTOObject.setBookedDate(bookingItem.getBookedDate());
                bookingDTOObject.setBookedTimeFrom(bookingItem.getBookedTimeFrom());
                bookingDTOObject.setBookedTimeTo(bookingItem.getBookedTimeTo());
                bookingDTOList.add(bookingDTOObject);
            }
            object.setBookingDTOList(bookingDTOList);

        childDTOList.add(object);
        }

        //Step 2: make a list of ContactChildDTO
        ContactDTO contactChildrenDTO = new ContactDTO();
        ContactApi contactApi = contactRepositoryApi.getContactByIdApi(id);

        contactChildrenDTO.setId(contactApi.getId());
        String contactFullName = contactApi.getFirstName() + " " + contactApi.getLastName();
        contactChildrenDTO.setFullName(contactFullName);
        contactChildrenDTO.setRelationship(contactApi.getRelationship());
        contactChildrenDTO.setChildDTOList(childDTOList);

        //step 3: return object<ContactDTO>
        return contactChildrenDTO;
    }




}
