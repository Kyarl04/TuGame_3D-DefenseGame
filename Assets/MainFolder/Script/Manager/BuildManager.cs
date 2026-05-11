using UnityEngine;

public class BuildManager : MonoBehaviour {

	public static BuildManager instance;
	public TurretBlueprint[] randomTurrets;

	void Awake ()
	{
		if (instance != null)
		{
			Debug.LogError("More than one BuildManager in scene!");
			return;
		}
		instance = this;
	}

	public GameObject buildEffect;
	public GameObject sellEffect;

	private TurretBlueprint turretToBuild;
	private Node selectedNode;

	public NodeUI nodeUI;

	public bool CanBuild { get { return turretToBuild != null; } }
	public bool HasMoney { get { return PlayerStats.Money >= turretToBuild.cost; } }

	public void SelectNode (Node node)
	{
		if (selectedNode == node)
		{
			DeselectNode();
			return;
		}

		selectedNode = node;
		turretToBuild = null;

		nodeUI.SetTarget(node);
	}

	public void BuildRandomTurretOn(Node node)
	{
		if (PlayerStats.Money < 100) // 소환 비용 (예: 100)
		{
			Debug.Log("돈이 부족합니다!");
			return;
		}

		// 랜덤 인덱스 선택
		int randomIndex = Random.Range(0, randomTurrets.Length);
		TurretBlueprint blueprint = randomTurrets[randomIndex];

		// 타워 생성 로직 (기존 BuildTurretOn 로직 활용)
		GameObject turret = (GameObject)Instantiate(blueprint.prefab, node.GetBuildPosition(), Quaternion.identity);
		node.turret = turret;

		GameObject effect = (GameObject)Instantiate(buildEffect, node.GetBuildPosition(), Quaternion.identity);
		Destroy(effect, 5f);

		PlayerStats.Money -= 100; // 비용 차감
	}

	public void DeselectNode()
	{
		selectedNode = null;
		nodeUI.Hide();
	}

	public void SelectTurretToBuild (TurretBlueprint turret)
	{
		turretToBuild = turret;
		DeselectNode();
	}

	public TurretBlueprint GetTurretToBuild ()
	{
		return turretToBuild;
	}

}
