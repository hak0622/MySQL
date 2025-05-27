package app;

import app.domain.Todo;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.InsertManyResult;
import com.mongodb.client.result.InsertOneResult;
import com.mongodb.client.result.UpdateResult;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;
import static com.mongodb.client.model.Filters.eq;

import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.List;

public class App2 {
    public static void main(String[] args) {
        MongoCollection<Todo>collection = Database.getCollection("todo",Todo.class);
//        insertTodo(collection,"졸리다","졸리다고");
//        insertManyTodo(collection,"샘플",5);
//        selectAllTodo(collection);
//        selectTodo(collection,"68350fa19b28d4ce4a9036fb");
//        updateTodo(collection,"68350fa19b28d4ce4a9036fb",true);
//        updateAllTodo(collection,true);
//        deleteTodo(collection,"68350fa19b28d4ce4a9036fb");
        deleteAllTodo(collection);
        Database.close();
    }
    private static void insertTodo(MongoCollection<Todo>collection,String title,String desc){
        Todo todo = new Todo(null,title,desc,false);
        InsertOneResult result = collection.insertOne(todo);
        System.out.println("todo 추가 성공 ==> id:"+result.getInsertedId());
    }
    private static void insertManyTodo(MongoCollection<Todo>collection, String str, int count){
        List<Todo>todoList = new ArrayList<>();
        for(int i=0; i<count; i++){
            Todo todo = new Todo(null,str+i,str+i+"설명",false);
            todoList.add(todo);
        }
        InsertManyResult result= collection.insertMany(todoList);
    }
    private static void selectAllTodo(MongoCollection<Todo>collection){
        List<Todo>todoList = new ArrayList<>();
        collection.find().into(todoList);
        todoList.forEach(System.out::println);
    }

    private static void selectTodo(MongoCollection<Todo>collection,String id){
        Bson query = Filters.eq("_id",new ObjectId(id));
        Todo todo = collection.find(query).first();
        if(todo == null){
            System.out.println("일치아이디 없다");
            return;
        }
        System.out.println("id:"+todo.getId());
        System.out.println("title:"+todo.getTitle());
        System.out.println("desc:"+todo.getDesc());
        System.out.println("done:"+todo.isDone());
    }
    private static void updateTodo(MongoCollection<Todo>collection,String id,boolean done){
        //쿼리 셀렉터(조건) 생성
        Bson query = eq("_id",new ObjectId(id));

        //업데이트할 내용(set, unset 등)
        Bson update = Updates.set("done",done);

        //실행 후 결과 객체 반환 (updateOne(),UpdateResult)
        // -> 수정된 문서의 개수 얻을 수 있음
        UpdateResult result = collection.updateOne(query,update);

        //개수 == 0
        //실패 메시지 출력
        if(result.getModifiedCount()==0){
            System.out.println("일치하는 _id를 가지는 문서가 없거나 수정 사항 없음");
            return;
        }
        //개수 > 0
        //성공 메세지 출력 + selectTodo(collection,id) 호출
        System.out.println("===수정===");
        selectTodo(collection,id);
    }
    private static void updateAllTodo(MongoCollection<Todo>collection,boolean done){
        //db.todo.updateMany({},{$set : {done : true}})
        Bson query = Filters.empty(); // 빈 조건(쿼리셀렉터) {} 생성
        Bson update = Updates.set("done",done);
        UpdateResult result = collection.updateMany(query,update);
        if(result.getModifiedCount()==0){
            System.out.println("변경 사항 없음 ");
            return;
        }
        System.out.println("일괄 수정 완료");
        selectAllTodo(collection);
    }
    private static void deleteTodo(MongoCollection<Todo>collection,String id){
        Bson query = eq("_id",new ObjectId(id));
        DeleteResult result = collection.deleteOne(query);

        if(result.getDeletedCount() ==0){
            System.out.println("일치 id 없음");
            return;
        }
        System.out.println("삭제 성공");
    }
    private static void deleteAllTodo(MongoCollection<Todo>collection){
        Bson query = Filters.empty(); // 조건 없다
        DeleteResult result = collection.deleteMany(query);
        System.out.println("삭제된 문서 개수 : "+result.getDeletedCount());
    }
}
