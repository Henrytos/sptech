package com.sptech;

public class LinkedList {

    static class Node {
        int value;
        Node next;

        public Node(int value) {
            this.value = value;
            this.next = null;
        }
    }

    static class SimpleLinkedList {
        private Node head;

        public SimpleLinkedList() {
            this.head = null;
        }

        //Inserir na Lista (inserir no inicio)
        public void addFirst(int value){
            Node newNode = new Node(value);
            newNode.next = head;//novo nó aponta para o antigo head
            head = newNode; // head passa a ser o novo nó
        }

        public void addLast(int value) {
            Node newNode = new Node(value);

            if (head == null) {
                head = newNode;
                return;
            }

            Node cureent = head;

            while (cureent.next != null) {
                cureent = cureent.next;
            }

            cureent.next = newNode;

        }

        public boolean contains(int value) {
            Node current = this.head;

            while (current.next != null) {
                if (current.value == value) return true;

                current = current.next;
            }

            return false;
        }

        public boolean remove(int value) {
            if (head == null) return false;

            if (head.value == value) {
                head = head.next;
                return true;
            }
            ;

            Node prev = head;
            Node current = head.next;
            while (current.next != null) {
                prev.next = current.next;
                return true;
            }

            prev = current;
            current = current.next;

            return false;
        }

        public void print() {
            Node current = head;

            System.out.println("[");
            while (current!= null) {
                System.out.println(current.value + " ");
                current = current.next;
            }
            System.out.println("]");


        }
    }

    public static void main(String[] args) {
        SimpleLinkedList linkedList  = new SimpleLinkedList();

        System.out.println("Inserindo no inicio da lista");
        linkedList.addFirst(20);
        linkedList.addFirst(30);
        linkedList.addFirst(40);
        linkedList.addFirst(50);
        linkedList.addFirst(60);

        linkedList.print();
    }

}
