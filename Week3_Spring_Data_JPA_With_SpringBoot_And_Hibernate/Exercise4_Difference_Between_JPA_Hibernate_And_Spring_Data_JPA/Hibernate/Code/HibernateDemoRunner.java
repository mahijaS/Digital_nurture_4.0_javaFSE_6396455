package com.cognizant;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HibernateDemoRunner {

    private static final SessionFactory sessionFactory =
            new Configuration().configure()       // loads hibernate.cfg.xml
                    .buildSessionFactory();

    public static void main(String[] args) {
        Integer id = createEmployee("Alice", "Doe", "alice@example.com");
        Employee e = getEmployee(id);
        updateEmail(id, "alice@updated.com");
        deleteEmployee(id);
        sessionFactory.close();                  // clean shutdown
    }

    /* --------------- CRUD helpers ---------------- */

    private static Integer createEmployee(String fn, String ln, String email) {
        Session s = sessionFactory.openSession();
        Transaction tx = null; Integer generatedId = null;
        try {
            tx = s.beginTransaction();
            generatedId = (Integer) s.save(new Employee(fn, ln, email));
            tx.commit();
        } catch (Exception ex) { if (tx!=null) tx.rollback(); }
        finally { s.close(); }
        return generatedId;
    }

    private static Employee getEmployee(Integer id) {
        try (Session s = sessionFactory.openSession()) {
            return s.get(Employee.class, id);
        }
    }

    private static void updateEmail(Integer id, String newEmail) {
        Transaction tx = null;
        try (Session s = sessionFactory.openSession()) {
            tx = s.beginTransaction();
            Employee e = s.get(Employee.class, id);
            e.setEmail(newEmail);
            s.update(e);
            tx.commit();
        } catch (Exception ex) { if (tx!=null) tx.rollback(); }
    }

    private static void deleteEmployee(Integer id) {
        Transaction tx = null;
        try (Session s = sessionFactory.openSession()) {
            tx = s.beginTransaction();
            Employee e = s.get(Employee.class, id);
            if (e != null) s.delete(e);
            tx.commit();
        } catch (Exception ex) { if (tx!=null) tx.rollback(); }
    }
}
