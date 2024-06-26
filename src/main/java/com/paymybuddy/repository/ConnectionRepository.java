package com.paymybuddy.repository;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

@Repository
public class ConnectionRepository {
	@PersistenceContext
	private EntityManager entityManager;

	@Transactional
	public void addConnection(Integer idUser, Integer idFriend) {
		try {
			String query = "INSERT INTO connections(id_user, id_friend) VALUES (:id_user, :id_friend)";
			entityManager //
					.createNativeQuery(query) //
					.setParameter("id_user", idUser) //
					.setParameter("id_friend", idFriend) //
					.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			entityManager.close();
		}
	}

	public BigInteger countConnection(Integer idUser, Integer idFriend) {
		try {

			String query = "SELECT count(*) from connections WHERE id_user= :id_user and id_friend= :id_friend";
			return (BigInteger) entityManager //
					.createNativeQuery(query) //
					.setParameter("id_user", idUser) //
					.setParameter("id_friend", idFriend).getSingleResult();
		} catch (Exception e) {
			throw e;
		} finally {
			entityManager.close();
		}
	}

	@SuppressWarnings("unchecked")
	public Map<Integer, String> getFriendsList(Integer id) {
		try {
			String query = "SELECT co.id_friend ,d.mail  FROM connections co JOIN dbuser d ON co.id_friend = d.id WHERE co.id_user =:id_user";
			List<Object[]> resultList = entityManager //
					.createNativeQuery(query) //
					.setParameter("id_user", id)//
					.getResultList(); //

			Map<Integer, String> mailFriend = new HashMap<Integer, String>();

			for (Object[] objects : resultList)
				mailFriend.put((Integer) objects[0], (String) objects[1]);

			return mailFriend;
		} catch (Exception e) {
			throw e;
		} finally {
			entityManager.close();
		}
	}

}
