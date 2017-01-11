package ru.tsandaProject.contactManager.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.tsandaProject.contactManager.dao.ContactDAO;
import ru.tsandaProject.contactManager.model.Contact;

import java.util.List;

/**
 *
 */
@Service
public class ContactServiceImpl implements ContactService {

    private ContactDAO contactDAO;

    public void setContactDAO(ContactDAO contactDAO) {
        this.contactDAO = contactDAO;
    }

    @Transactional
    public void addContact(Contact contact) {
        this.contactDAO.addContact(contact);
    }

    @Transactional
    public void updateContact(Contact contact) {
        this.contactDAO.updateContact(contact);
    }

    @Transactional
    public void removeContact(Integer id) {
        this.contactDAO.removeContact(id);
    }

    @Transactional
    public Contact getContactById(Integer id) {
        return this.contactDAO.getContactById(id);
    }

    @Transactional
    public List<Contact> listContact() {
        return this.contactDAO.listContact();
    }
}
