package ru.tsandaProject.contactManager.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.tsandaProject.contactManager.model.Contact;
import ru.tsandaProject.contactManager.service.ContactService;

/**
 *
 */
@Controller
public class MainController {

    private ContactService contactService;

    @Autowired
    @Qualifier(value = "contactService")
    public void setContactService(ContactService contactService) {
        this.contactService = contactService;
    }

    @RequestMapping("/")
    public String home(Model model) {
        model.addAttribute("name", "Andrej Tsanda");

        return "index";
    }

    @RequestMapping(value = "contacts", method = RequestMethod.GET)
    public String listContact(Model model) {
        model.addAttribute("contact", new Contact());
        model.addAttribute("listContacts", this.contactService.listContact());

        return "contacts";
    }

    @RequestMapping(value = "/contacts/add", method = RequestMethod.POST)
    public String addContact(@ModelAttribute("contact") Contact contact) {
        if(contact.getId() == null) {
            this.contactService.addContact(contact);
        } else {
            this.contactService.updateContact(contact);
        }

        return "redirect:/contacts";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeContact(@PathVariable("id") Integer id) {
        this.contactService.removeContact(id);

        return "redirect:/contacts";
    }

    @RequestMapping(value = "/edit/{id}")
    public String editContact(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("contact", this.contactService.getContactById(id));
        model.addAttribute("listContacts", this.contactService.listContact());

        return "contacts";
    }

    @RequestMapping(value = "contactData/{id}")
    public String contactData(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("contact", this.contactService.getContactById(id));

        return "contactData";
    }
}
