import SwiftUI

struct ContentView: View {
    
    @State var todos = [ToDo]()
    
    @State var task: String = ""
    
    private func addToDo(){
        self.todos.append(ToDo(name: task))
        task = ""
    }
    
    func deleteToDo(at offsets: IndexSet){
        todos.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Add To Do", text: $task, onCommit: addToDo)
                .padding(12)
                List{
                    ForEach(todos){ todo in
                        Text(todo.name)
                    }
                    .onDelete(perform: deleteToDo)
                }
            }
            .navigationBarTitle("To Do List", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
