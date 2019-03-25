package edu.unsam.api.repository

import java.util.Set
import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors abstract class Repository<T extends Entity> {

	@Accessors Set<T> repositoryContent = new HashSet<T>()

	def void create(T entity) {
		entity.isValid()
		entity.setId(this.getNewId())
		this.repositoryContent.add(entity)

	}

	def int getNewId() {
		if (repositoryContent.size() === 0) {
			return 0
		} else {
			return this.generateNewId()
		}

	}

	def int generateNewId() {
		return this.repositoryContent.maxBy[item|item.id].id + 1
	}

	def T searchById(int id) {
		val object = this.repositoryContent.findFirst[item|item.id === id]
		return object;
	}

	def boolean exist(T object)
}