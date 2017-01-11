package ru.tsandaProject.contactManager.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import ru.tsandaProject.contactManager.model.Contact;

import java.util.List;

/**
 *
 */
@Repository
public class ContactDAOImpl implements ContactDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addContact(Contact contact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(contact);
    }

    public void updateContact(Contact contact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(contact);
    }

    public void removeContact(Integer id) {
        Session session = this.sessionFactory.getCurrentSession();
        Contact contact = (Contact) session.load(Contact.class, new Integer(id));
        if(contact != null) {
            session.delete(contact);
        }
    }

    public Contact getContactById(Integer id) {
        Session session = this.sessionFactory.getCurrentSession();
        Contact contact = (Contact) session.load(Contact.class, new Integer(id));

        return contact;
    }

    public List<Contact> listContact() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Contact> contactList = session.createQuery("from Contact").list();

        return contactList;
    }
}
