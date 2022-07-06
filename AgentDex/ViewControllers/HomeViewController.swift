//
//  ViewController.swift
//  AgentDex
//
//  Created by Pedro Ganem on 03/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var agents: [AgentEntity] = []
    let agentsTableView = UITableView()
    let safeArea = UIView()

    override func viewDidLoad() {
        view.backgroundColor = .white
        createAgentList()
        super.viewDidLoad()
    }
    
    private func createAgentList() {
        fetchAgents()
        setTableViewDelegates()
        view.addSubview(agentsTableView)
        agentsTableView.rowHeight = 100
        agentsTableView.translatesAutoresizingMaskIntoConstraints = false
        agentsTableView.register(AgentCell.self, forCellReuseIdentifier: "AgentCell")
        agentsTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 32).isActive = true
        agentsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 32).isActive = true
        agentsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        agentsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 32).isActive = true
        
    }
    
    private func setTableViewDelegates() {
        agentsTableView.delegate = self
        agentsTableView.dataSource = self
    }
    
    
    private func fetchAgents() {
        let url = URL(string: "https://valorant-api.com/v1/agents")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if let data = data {
                let decodedJson = try? JSONDecoder().decode(Result.self, from: data)
                self.agents = decodedJson?.result ?? []
            }
        }
        
        task.resume()
        
        }
    
    
    private func renderTitle() {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.text = "AgentDex"
        title.font = title.font.withSize(24)
        safeArea.addSubview(title)
    }
    
    private func renderAgentList() {
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = agentsTableView.dequeueReusableCell(withIdentifier: "AgentCell") as! AgentCell
        let agent = agents[indexPath.row]
        print(agent.displayName)
        cell.set(agent: agent)
        return cell
    }
}

class AgentCell: UITableViewCell {
    
    let agentAvatarView = UIImageView()
    let agentDisplayName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(agentDisplayName)
        configureLabelView()
        
    }
    
    func set(agent: AgentEntity) {
        agentDisplayName.text = agent.displayName
    }
    
    func configureLabelView() {
        agentDisplayName.font.withSize(24)
        agentDisplayName.backgroundColor = .red
        agentDisplayName.frame = CGRect(x: 0, y: 0, width: 100, height: 24)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("deu ruim")
    }
    
    
}


