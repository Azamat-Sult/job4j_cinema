package ru.job4j.cinema.service;

import ru.job4j.cinema.model.Account;
import ru.job4j.cinema.model.Ticket;
import ru.job4j.cinema.persistence.PsqlStore;

import java.util.List;

public class Cinema {

    private int hallRows = 7;

    private int hallSeatsInRow = 11;

    private int sessionId = 111;

    private int[][] hall = new int[hallRows][hallSeatsInRow];

    private static final class Lazy {
        private static final Cinema INST = new Cinema();
    }

    public static Cinema instOf() {
        return Cinema.Lazy.INST;
    }

    public void buyTicket(int row, int cell, String fio, String phone) throws Exception {
        Account account = PsqlStore.instOf().findAccountByPhone(phone);
        if (account == null) {
            account = PsqlStore.instOf().saveAccount(new Account(0, fio, fio + "@mail.ru", phone));
        }
        PsqlStore.instOf().saveTicket(new Ticket(0, sessionId, row, cell, account.getId()));
    }

    public int[][] getHall() {
        List<Ticket> tickets = PsqlStore.instOf().getAllTickets();
        if (tickets.size() != 0) {
            for (Ticket ticket : tickets) {
                hall[ticket.getRow()][ticket.getCell()] = 1;
            }
        }
        return hall;
    }
}
