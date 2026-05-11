using UnityEngine;

public class Shop : MonoBehaviour {

	public TurretBlueprint standardTurret;
	public TurretBlueprint missileLauncher;
	public TurretBlueprint laserBeamer;

	BuildManager buildManager;

	void Start ()
	{
		buildManager = BuildManager.instance;
	}
	
	public void OnCreateButtonClick()
	{
		// 1. 씬에 있는 모든 노드(타워 설치 칸)를 찾습니다.
		Node[] allNodes = GameObject.FindObjectsOfType<Node>();
		
		// 2. 그 중 비어있는 노드들만 리스트에 담습니다.
		System.Collections.Generic.List<Node> emptyNodes = new System.Collections.Generic.List<Node>();
		foreach (Node node in allNodes)
		{
			if (node.turret == null) 
			{
				emptyNodes.Add(node);
			}
		}

		// 3. 비어있는 칸이 있다면 랜덤하게 하나 골라 타워를 생성합니다.
		if (emptyNodes.Count > 0)
		{
			int randomIndex = Random.Range(0, emptyNodes.Count);
			BuildManager.instance.BuildRandomTurretOn(emptyNodes[randomIndex]);
		}
		else
		{
			Debug.Log("설치할 빈 공간이 없습니다!");
		}
	}

	public void SelectStandardTurret ()
	{
		Debug.Log("Standard Turret Selected");
		buildManager.SelectTurretToBuild(standardTurret);
	}

	public void SelectMissileLauncher()
	{
		Debug.Log("Missile Launcher Selected");
		buildManager.SelectTurretToBuild(missileLauncher);
	}

	public void SelectLaserBeamer()
	{
		Debug.Log("Laser Beamer Selected");
		buildManager.SelectTurretToBuild(laserBeamer);
	}

}
