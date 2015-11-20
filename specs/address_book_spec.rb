require_relative '../models/address_book'

 RSpec.describe AddressBook do
   let(:book) { AddressBook.new }

   def check_entry(entry, expected_name, expected_number, expected_email)
     expect(entry.name).to eq expected_name
     expect(entry.phone_number).to eq expected_number
     expect(entry.email).to eq expected_email
   end

   describe "attributes" do
     it "should respond to entries" do
       book = AddressBook.new
       expect(book).to respond_to(:entries)
     end

     it "should initialize entries as an array" do
       book = AddressBook.new
       expect(book.entries).to be_a(Array)
     end

     it "should initialize entries as empty" do
       book = AddressBook.new
       expect(book.entries.size).to eq(0)
     end
   end

   describe "#add_entry" do
     it "adds only one entry to the address book" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

       expect(book.entries.size).to eq(1)
     end

     it "adds the correct information to entries" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]

       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end

   describe "#remove_entry" do
    it "removes only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Mohammad Khattak', '010.012.1815', 'mo@lovelace.com')
      expect(book.entries.size).to eq(1)

      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(2)

      book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)

      expect(book.entries.first.email).to eq('mo@lovelace.com')
    end
  end

  describe "#import_from_csv" do
     it "imports the correct number of entries" do

       book.import_from_csv("entries.csv")
       book_size = book.entries.size

       expect(book_size).to eq 5
     end

     it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       entry_one = book.entries[0]
       check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
     end

     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
     end

    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]
      check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
    end

    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]
      check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
    end

    it "imports the correct number of entries" do
      book.import_from_csv("entries2.csv")
      book_size = book.entries.size
      expect(book_size).to eql 3
    end

    it "imports the 1st entry from the other CSV file" do
      book.import_from_csv("entries2.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Heda" ,"702-321-9754", "heda@hedahahn.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries2.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Caroling", "214-466-7131", "cgsmalley@gmail.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries2.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Greg", "214-368-7030", "greg@halfile.com")
    end

   end
 end
