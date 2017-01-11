package ru.tsandaProject.contactManager.dao;

import ru.tsandaProject.contactManager.model.Contact;

import java.util.List;

/**
 *
 */
public interface ContactDAO {

    public void addContact(Contact contact);

    public void updateContact(Contact contact);

    public void removeContact(Integer id);

    public Contact getContactById(Integer id);

    public List<Contact> listContact();
}
