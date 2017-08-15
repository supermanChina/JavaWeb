# DOM4J

[TOC]


参考资料：  
[dom4j.org](https://dom4j.github.io/)
[Dom4j 使用简介](http://www.blogjava.net/i369/articles/154264.html)

## 读取并解析XML文档
读写XML文档主要依赖于org.dom4j.io包，其中提供DOMReader和SAXReader两类不同方式，而调用方式是一样的。
```
 // 从文件读取XML，输入文件名，返回XML文档
public Document read(String fileName) throws MalformedURLException, DocumentException {
   SAXReader reader = new SAXReader();
   Document document = reader.read(new File(fileName));
   return document;
}
```
其中，reader的read方法是重载的，可以从InputStream, File, Url等多种不同的源来读取。得到的Document对象就带表了整个XML。
根据本人自己的经验，读取的字符编码是按照XML文件头定义的编码来转换。如果遇到乱码问题，注意要把各处的编码名称保持一致即可。  
## 获取root节点
```
public Element getRootElement(Document doc)
{
   return doc.getRootElement();
}
```
## 遍历XML树
DOM4J提供至少3种遍历节点的方法：  
1) 枚举(Iterator)  
```
// 枚举所有子节点
for ( Iterator i = root.elementIterator(); i.hasNext(); ) {
   Element element = (Element) i.next();
   // do something
}
// 枚举名称为foo的节点
for ( Iterator i = root.elementIterator(foo); i.hasNext();) {
   Element foo = (Element) i.next();
   // do something
}
// 枚举属性
for ( Iterator i = root.attributeIterator(); i.hasNext(); ) {
   Attribute attribute = (Attribute) i.next();
   // do something
}
```  
2)递归
递归也可以采用Iterator作为枚举手段，但文档中提供了另外的做法  
```
public void treeWalk() {
   treeWalk(getRootElement());
}
public void treeWalk(Element element) {
   for (int i = 0, size = element.nodeCount(); i < size; i++)     {
	   Node node = element.node(i);
	   if (node instanceof Element) {
		  treeWalk((Element) node);
	   } else { // do something....
	   }
   }
}
```
3) Visitor模式
最令人兴奋的是DOM4J对Visitor的支持，这样可以大大缩减代码量，并且清楚易懂。了解设计模式的人都知道，Visitor是GOF设计模式之一。其主要原理就是两种类互相保有对方的引用，并且一种作为Visitor去访问许多Visitable。我们来看DOM4J中的Visitor模式(快速文档中没有提供)  
只需要自定一个类实现Visitor接口即可。  
```
public class MyVisitor extends VisitorSupport {
           public void visit(Element element){
               System.out.println(element.getName());
           }
           public void visit(Attribute attr){
               System.out.println(attr.getName());
           }
        }
 
        调用：  root.accept(new MyVisitor())
```
Visitor接口提供多种Visit()的重载，根据XML不同的对象，将采用不同的方式来访问。上面是给出的Element和Attribute的简单实现，一般比较常用的就是这两个。VisitorSupport是DOM4J提供的默认适配器，Visitor接口的Default Adapter模式，这个模式给出了各种visit(*)的空实现，以便简化代码。  
** 注意，这个Visitor是自动遍历所有子节点的。如果是root.accept(MyVisitor)，将遍历子节点。我第一次用的时候，认为是需要自己遍历，便在递归中调用Visitor，结果可想而知。 **  
## XPath支持
DOM4J对XPath有良好的支持，如访问一个节点，可直接用XPath选择。  
```
public void bar(Document document) {
        List list = document.selectNodes( //foo/bar );
        Node node = document.selectSingleNode(//foo/bar/author);
        String name = node.valueOf( @name );
     }
```
例如，如果你想查找XHTML文档中所有的超链接，下面的代码可以实现： 
```
public void findLinks(Document document) throws DocumentException {
        List list = document.selectNodes( //a/@href );
        for (Iterator iter = list.iterator(); iter.hasNext(); ) {
            Attribute attribute = (Attribute) iter.next();
            String url = attribute.getValue();
        }
     }
```
## 字符串与XML的转换
有时候经常要用到字符串转换为XML或反之  
```
    // XML转字符串
　 Document document = ...;
    String text = document.asXML();
// 字符串转XML
    String text = James ;
    Document document = DocumentHelper.parseText(text);
```
## 用XSLT转换XML
```
public Document styleDocument(
       Document document,
       String stylesheet
    ) throws Exception {
    // load the transformer using JAXP
    TransformerFactory factory = TransformerFactory.newInstance();
    Transformer transformer = factory.newTransformer(
       new StreamSource( stylesheet )
    );
    // now lets style the given document
    DocumentSource source = new DocumentSource( document );
    DocumentResult result = new DocumentResult();
    transformer.transform( source, result );
    // return the transformed document
    Document transformedDoc = result.getDocument();
    return transformedDoc;
}
```
## 创建XML
  一般创建XML是写文件前的工作，这就像StringBuffer一样容易。  
```
 public Document createDocument() {
       Document document = DocumentHelper.createDocument();
       Element root = document.addElement(root);
       Element author1 =
           root
              .addElement(author)
              .addAttribute(name, James)
              .addAttribute(location, UK)
              .addText(James Strachan);
       Element author2 =
           root
              .addElement(author)
              .addAttribute(name, Bob)
              .addAttribute(location, US)
              .addText(Bob McWhirter);
       return document;
    }
```
## 文件输出
一个简单的输出方法是将一个Document或任何的Node通过write方法输出  
```
FileWriter out = new FileWriter( foo.xml );
    document.write(out);
```
如果你想改变输出的格式，比如美化输出或缩减格式，可以用XMLWriter类  
```
public void write(Document document) throws IOException {
       // 指定文件
       XMLWriter writer = new XMLWriter(
           new FileWriter( output.xml )
       );
       writer.write( document );
       writer.close();
       // 美化格式
       OutputFormat format = OutputFormat.createPrettyPrint();
       writer = new XMLWriter( System.out, format );
       writer.write( document );
       // 缩减格式
       format = OutputFormat.createCompactFormat();
       writer = new XMLWriter( System.out, format );
       writer.write( document );
    }
```

