    1. Create an account with https://www.ibm.com/us-en/marketplace/supervised-machine-learning
    2. Create/Add "Type System" - A type system defines the entities and relationships between entities that matter to the business.
    3. Create "Dictionaries" 
        a. Car Parts : https://en.wikipedia.org/wiki/List_of_auto_parts
        b. Car Manufacturers & models: https://en.wikipedia.org/wiki/List_of_automobile_manufacturers
    4.  Import Documents Corpus(Documents Tab)
    5.  Creating annotation sets(Documents Tab) - An annotation set is a subset of documents from an imported document set that you assign to a human annotator. The human  annotator annotates the documents in the annotation set.
    6.  Pre-annotating with a dictionary-based annotator(Annonator Component).
        a. Create a "Dictionary" annotator.
        b. Run the annotators by selecting the document set created in above step.
    7.  Creating an annotation task and Annotating documents
        a. Select "Human Annotation" Tab and create one or more task. The number of tasks created equals the number of users working on the set.
        b. Select the task and annotate. This is the most important action and usually done by people who understand the business model.        
            Annotate and specify relations
        c. Submit all once all the documents are annotated. The status will show as "Submitted" in the Tasks tab. 
        d. Select the set and "Accept" the changes. This completes the annotation process. 
        e. Follow these steps for all the sets
    8.  Creating a machine-learning annotator(Annonator Component).
        a. Create machine learning annotator
        b. Click "Next" and select Dictionary Mapping (Select "Reuse mapping that is defined for dictionary pre-annotator")
        c Click "Train and Evaluate". This step will take some time to complete 
    9.  Publich the model to Alchemy 
        a. Capture the Modelid- 78920c78-5a2a-40ed-9c55-b09d72cc52c3. This is required if you need to write your own apps.

