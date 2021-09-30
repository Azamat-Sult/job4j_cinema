package ru.job4j.cinema.persistence;

import ru.job4j.cinema.model.Account;
import ru.job4j.cinema.model.Ticket;

import java.util.List;

public interface Store {

    Account saveAccount(Account account);

    Account findAccountByPhone(String phone);

    Ticket saveTicket(Ticket ticket) throws Exception;

    List<Ticket> getAllTickets();

}
