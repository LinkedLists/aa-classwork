// View the full problem and run the test cases at:
//  https://leetcode.com/problems/course-schedule/

function canFinish(numCourses, prerequisites) {
  let prereq = buildGraph(prerequisites)
  let completed = new Set()
  let totalCourses = Object.keys(prereq).length

  let eligible = true

  while(eligible) {  
    eligible = false  
    for (let course in prereq) {
       let prereqMet = prereq[course].every( pre => 
         completed.has(pre)
       )

       if (!completed.has(course) && prereqMet) {
         completed.add(course)
         eligible = true
       }
    }
  }

  return completed.size === totalCourses
}

function buildGraph(prereq) {
  let graph = {}

  prereq.forEach( pair => {
    let [course, pre] = pair.map(String)

    if (course in graph) {
      graph[course].push(pre)
    } else {
      graph[course] = [pre]
    }

    if (!(pre in graph)) {
      graph[pre] = []
    }


  })

  return graph
}
