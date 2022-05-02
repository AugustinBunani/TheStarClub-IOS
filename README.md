<h1>Star Entertainment Group: The Star Club App - IOS - READ ME</h1>

Screen layout (InVision): <a href="https://app.diagrams.net">https://app.diagrams.net</a>

<h3>Application Architecture</h3>
 
To create a maintainable application I have decided to create this app using the architectural parent (MVVM - Model View ViewModel). This design architecture will allow me to create an app, that is extendable and extremely easy to maintain. This design pattern is fully supported and encouraged by google and includes all of their first party libraries. 
 
 
 
 <div>
   <table width="50%" height="50%" align="center" valign="center">
   <tr><td>
      <img src="https://user-images.githubusercontent.com/48664320/164951850-9ae1cad9-4dc2-4b4d-bbfd-0bfc432b7b62.png" alt="MVVM"/>
   </td></tr>
   </table>
</div>
 
 <ul>
 <li><b>Model</b></li>
 This is where all of our business related code will be stored. 
 Models are used exclusively as our domain objects, to provide definitions and structure to the objects we need to fetch from the apis provided. 
 
<li><b>Reporsitory</b></li>
 Repositories here are used as the trafic lanes between the provided APIs and our data models - Domain Obects. 
 

 <li><b>View</b></li>
  This is the part of the app which concerns each part of the app the the user interacts with. Views handle only the immediate interactions between users   and the app itself. So everything visible on the app will be displayed using views. Views will be straight forward and will not concern themselves with any business logic or data manipulations. 
  
 <li><b>ViewModel</b></li>
  Most if not all of the view logic will be handled by the ViewModel. ViewModels will give views directions and instructions on what to display and govern most of the UI logic. ViewModels are the transmission lanes between the views and the business logic of our code they will grab data from the repositories and  transmit it over to the views to display. 
</ul>

<h3>Data Architecture</h3>


<h3>Network Architecture</h3>
 
Currently there are 2 APIs serving the information required to display in app!

User Data: <a href="https://run.mocky.io/v3/c1819867-9260-4d1e-b9e1-3a77372c83df">https://run.mocky.io/v3/c1819867-9260-4d1e-b9e1-3a77372c83df</a>

Benefits Data: <a href="https://run.mocky.io/v3/6bd03c3d-8b70-40fe-b26c-36bfc03296ff">https://run.mocky.io/v3/6bd03c3d-8b70-40fe-b26c-36bfc03296ff</a>

All network connection in this app is carried out using Volley inside API.kts class. It is important for all network operations to be executed in this class in order to be queued and handled properly.

Unlike the database operations, all network operations are handled asynchronously and this app will use EventBus as well to inform the caller of the result.

Volley is a third party application to handle network calls to fetch data from given APIs and will utilize Eventbus to inform us when data has been fetched and results are ready. We can use an Async funct to achieve the same outcome but for a more cleaner, maintainable, extendable and robust code Volley is the one of the best third party library to utilize here. 

Below are the sample of an GET request:

<pre>
<code>

 val url = "http://my-json-feed"

    func fetchData<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void)
    {

        guard let url = url else{
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let error = error as? URLError{
                completion(Result.failure(APIError.url(error)))
            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode){
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data{
                
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                }catch{
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
            
        }
        task.resume()
    
    }

</code>

</pre>

<h3>UI and StoryCards</h3>

![image](https://user-images.githubusercontent.com/48664320/166229767-2a24ceff-52dd-4efd-a1f1-c8f057ce359b.png)


![image](https://user-images.githubusercontent.com/48664320/166229786-c663c70e-fb98-4043-902c-3f5ee0905551.png)

<h3>Documentation</h3>

Under AppDocumentation Directory within this code there is a version control document  <a href="https://github.com/AugustinBunani/TheStarClub-IOS/blob/main/TheStarClub/TheStarClub/Documentation/version_control_doc.md">HERE</a>. Which contains a list of all major pulls / push and commit entries to this repository. 


<h3>Libraries Used</h3>

</ul>

