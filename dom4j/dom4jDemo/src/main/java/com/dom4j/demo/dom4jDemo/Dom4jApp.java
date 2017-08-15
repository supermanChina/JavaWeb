package com.dom4j.demo.dom4jDemo;

import java.io.FileWriter;
import java.io.IOException;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.XMLWriter;

/**
 * Hello world!
 *
 */
public class Dom4jApp {
	public static void main(String[] args) {
		new Dom4jApp().createXMLFile("books.xml");
	}

	public int createXMLFile(String fileName) {
		int ret = 0;

		Document doc = DocumentHelper.createDocument();
		// Root elem is bookss
		Element booksElem = doc.addElement("books");
		// comment node
		booksElem.addComment("This is a demo for dom4j.");

		// book elem for books parent
		Element bookElem = booksElem.addElement("book");
		// book elem attribute
		bookElem.addAttribute("show", "true");
		// title elem for book parent
		Element titleElem = bookElem.addElement("title");
		// Text node
		titleElem.setText("Dom4j tutorials");

		// book elem for books parent
		bookElem = booksElem.addElement("book");
		// book elem attribute
		bookElem.addAttribute("show", "true");
		// title elem for book parent
		titleElem = bookElem.addElement("title");
		// Text node
		titleElem.setText("Lucene tutorials");

		// book elem for books parent
		bookElem = booksElem.addElement("book");
		// book elem attribute
		bookElem.addAttribute("show", "true");
		// title elem for book parent
		titleElem = bookElem.addElement("title");
		// Text node
		titleElem.setText("Redis tutorials");

		// owner elem
		Element ownerElem = booksElem.addElement("owner");
		ownerElem.setText("O'Reilly");

		try {
			XMLWriter writer = new XMLWriter(new FileWriter(fileName));
			writer.write(doc);
			writer.close();
			ret = 1;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ret;
	}
}
